  <script>
import { writable } from 'svelte/store';

    import Menu from './components/Menu.svelte';
    import {effects,random_effect,right_effects,search_effect,audiance_effect, glitch_effects, transition_effects, clock_effect,celebration_effect} from './data/effects.js';
    export let time;
    export let n_used = false;
    export let menu;
    export let score;
    export let score2;
    export let wrong_choice = false;
    export let right_choice = false;

    export let search_used = false;
    export let audiance_used = false;
    export let new_used = false;
    export let time_used = false;
    export let update_question = false;

    export let punishment_display = true;
    export let winner_display = false;
    let fade_video = false;
    let show = false;
    let end_video = false;
    
    document.addEventListener('keydown',function(e){
      if(e.key == "Escape"){
        end_video = !end_video;
      }
    });

    let videosProcessor = {
      timerCallback:function(){
        if(end_video){
          this.video.pause();
          end_video = false;
        }
        if(this.video.paused || this.video.ended || ( this.endTime>0 && this.video.currentTime >= this.endTime)){
          this.video.pause();
          if(this.video.ended || this.video.paused || ( this.endTime>0 && this.video.currentTime >= this.endTime)){
            fade_video =true;
            let self = this;
            setTimeout(function(){
              self.video.currentTime = 0;
              self.ctx2.restore();
              self.ctx1.restore();
              show = false;
              self.video.remove();
              
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
          if((g>80 && r<60 && b<60) && (g>0)){
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
        this.ctx1.save();
        this.ctx2.save();
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

    // document.addEventListener('DOMContentLoaded',()=>{
    //   videosProcessor.loadVideo({'url':'layout/video/chika_dance.mp4','start_time':0,'end_time':0});
    // });
    document.addEventListener('keypress',function(e){
      if(e.key == "*"){
        videosProcessor.loadVideo({'url':'layout/video/chika_dance.mp4','start_time':0,'end_time':0});
      }
    })
    $: if (right_choice){    
      videosProcessor.loadVideo(random_effect(right_effects));
    }
    $: if (wrong_choice){    
      videosProcessor.loadVideo(random_effect(effects));
    }

    $: if (search_used){    
      videosProcessor.loadVideo(random_effect(search_effect));
      search_used = false;
    }
    $: if (audiance_used){    
      videosProcessor.loadVideo(random_effect(audiance_effect));
      audiance_used = false;
    }
    $: if (new_used){    
      videosProcessor.loadVideo(random_effect(transition_effects));
      new_used = false;
      update_question = true;
    }

    $: if (n_used){    
      console.log(n_used);
      videosProcessor.loadVideo(random_effect(transition_effects));
      n_used = false;
      update_question = true;
    }
    $: if (time_used){    
      time+=15;
      videosProcessor.loadVideo(random_effect(clock_effect));
      time_used = false;
    }

    $: if (winner_display){    
      end_video = false;
      videosProcessor.loadVideo(random_effect(celebration_effect));
    }

    const selected_questions = writable([]);
    // selected_questions.subscribe(val => localStorage.setItem("selected_questions", val));
    let q_n;
    $: if(q_n) if($selected_questions.indexOf(q_n)==-1) { 
      $selected_questions=[...$selected_questions,q_n]; 
    }
    let menu_f;
    
  </script>

  <div class="wrapper question-background" id="container">
        <canvas id="c1" width="1920" height="1080"></canvas>
        <canvas class="animation_canvas" class:show class:fade_video id="c2" width="1920" height="1080"></canvas>
        <slot name="team-1"></slot>
        <slot name="team-2"></slot>
			  <Menu bind:update_question bind:time bind:q_n bind:right_choice selected_questions={$selected_questions} bind:wrong_choice bind:winner_display={winner_display} bind:punishment_display={punishment_display}></Menu>
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