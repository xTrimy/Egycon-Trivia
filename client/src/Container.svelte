  <script>
import { writable } from 'svelte/store';

    import Menu from './components/Menu.svelte';
    import {effects,random_effect,right_effects} from './data/effects.js';
    export let menu;
    export let wrong_choice = false;
    export let right_choice = false;
    export let punishment_display = false;
    let fade_video = false;
    let show = false;
    let videosProcessor = {
      timerCallback:function(){

        if(this.video.paused || this.video.ended || ( this.endTime>0 && this.video.currentTime >= this.endTime)){
          this.video.pause();
          if(this.video.ended || ( this.endTime>0 && this.video.currentTime >= this.endTime)){
            fade_video =true;
            let self = this;
            setTimeout(function(){
              self.video.currentTime = 0;
              self.ctx2.clearRect(0, 0, 1920, 1080);
              self.ctx1.clearRect(0, 0, 1920, 1080);
              show = false;
            },1000);
          }
          return;
        }
        this.computeFrame();
        let self = this;
        setTimeout(function(){
          self.timerCallback();
        },0);
      },
      doLoad: function(){
        show = true;
        let self = this;
        this.video.addEventListener('play',function(){
          self.width = 1920;
          self.height = 1080;
          self.timerCallback();
        });
      },
      computeFrame: function(){
        this.ctx1.drawImage(this.video,0,0,this.width,this.height);
        let frame = this.ctx1.getImageData(0,0,this.width,this.height);
        let l = frame.data.length/4;
        for(let i =0;i< l;i++ ){
          let r = frame.data[i * 4 + 0];
          let g = frame.data[i * 4 + 1];
          let b = frame.data[i * 4 + 2];
          if((g>70 && r<90 && b<90) && (g>0)){
            frame.data[i*4+3] = 0;
          }
        }
        this.ctx2.putImageData(frame,0,(window.innerHeight-this.height));
      },
      loadVideo: function(videodata){
        this.c2 = document.querySelector('#c2');
        this.ctx2 = this.c2.getContext('2d');
        this.c1 = document.querySelector('#c1');
        this.ctx1 = this.c1.getContext('2d');
        this.ctx1.clearRect(0, 0, 1920, 1080);
        this.ctx2.clearRect(0, 0, 1920, 1080);
        show = true;
        fade_video = false;
        let video_name = videodata['name'];
        let video_url = videodata['url'];
        let start_time = videodata['start_time'];
        let end_time = videodata['end_time'];
        this.startTime = start_time;
        this.endTime = end_time;
        
        this.video = document.querySelector('#video-'+video_name);
        if(this.video == null){
          let videoElement = document.createElement('video');
          videoElement.setAttribute('id',"video-"+video_name);
          videoElement.classList.add('effect-video');
          document.body.appendChild(videoElement);
          this.video = videoElement;
          this.video.src = video_url;
          // this.video.currentTime = this.startTime;
        }
        this.video.currentTime = this.startTime;
        this.video.play();
        this.doLoad();
      }
    };

    document.addEventListener('DOMContentLoaded',()=>{
      // videosProcessor.loadVideo({'url':'layout/video/chika_dance.mp4','start_time':0,'end_time':0});
    })
    $: if (right_choice){    
      videosProcessor.loadVideo(random_effect(right_effects));
    }
    $: if (wrong_choice){    
      videosProcessor.loadVideo(random_effect(effects));
    }
    const selected_questions = writable([]);
    let q_n;
    $: if(q_n) if($selected_questions.indexOf(q_n)==-1) $selected_questions=[...$selected_questions,q_n];
    let menu_f;
    
      </script>

  <div class="wrapper question-background">
        <canvas id="c1" width="1920" height="1080"></canvas>
        <canvas class="animation_canvas" class:show class:fade_video id="c2" width="1920" height="1080"></canvas>
        <slot name="team-1"></slot>
        <slot name="team-2"></slot>
			  <Menu  bind:q_n bind:right_choice selected_questions={$selected_questions} bind:wrong_choice bind:punishment_display={punishment_display}></Menu>
        <slot name="bottom"></slot>
    </div>

  <style>
    .animation_canvas{
      top:0;
      left:0;
      z-index: 99999;
      display:none;
      position: absolute;
    }
    .animation_canvas.show{
      display: block;
    }
    #c1{
      position: absolute;
      z-index: -1;
    }
    .fade_video{
      opacity:0;
      transition: opacity 1s;
    }
    :global(.effect-video){
      position: absolute;
      z-index: -1;
      top: 0;
      opacity: 0;
      left: 0;
      width: 0;
      height: 0;
    }
  </style>