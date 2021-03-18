
<div class="timer"  on:click={startTimer}>
  <div class="progress-ring-container svelte-o1x795">
      <svg class="progress-ring" width="125%" height="125%">
      <circle class:check class="progress-ring__circle 
      {time/startTime > 0.60 ? "green":(time/startTime>0.30?"yellow":"red")} 
      " stroke-width="20" fill="transparent" r="100" cx="125" cy="125"></circle>
    </svg>
</div>
    <div class="container-timer">
        {time}
    </div>
</div>
<audio id="tick-sound" src="layout/audio/tick.mp3"  loop="true" ></audio>
<audio id="buzz-sound" src="layout/audio/buzz.mp3" ></audio>
<script>

    const startTime = 10;
    let time = startTime;
    let timeout = false;
    export let check = null;
    clearInterval(check)
    function startTimer(){
        let percentage = time*100/startTime;
        setProgress(percentage);
        if(!check)
        check = setInterval(function(){
            const mainItem = document.querySelector('.timer');
            if(time <= 0 || !mainItem){
                clearInterval(check)
                timeout=true;
                return;
            }
            time--;
            percentage = time*100/startTime;
            setProgress(percentage);
        },1000);
        else{
            timer_functions.stop_timer();
        }
    }

    export const timer_functions = {
        stop_timer(){
            const tick_sound = document.querySelector("#tick-sound");
            const buzz_sound = document.querySelector("#buzz-sound");
            buzz_sound.pause();
            tick_sound.pause();
            clearInterval(check);
            check= null;
        }
    }
    let circumference;
    let radius;
    let circle;
    function setProgress(percent) {
        const tick_sound = document.querySelector("#tick-sound");
        const buzz_sound = document.querySelector("#buzz-sound");
        if(percent <= 20 && percent > 0){
            tick_sound.play();
        }else if(percent <= 0){
            buzz_sound.play();
            tick_sound.pause();
        }else{
            tick_sound.pause();
        }
        circle = document.querySelector('.progress-ring__circle');
        radius = circle.r.baseVal.value;
        circumference = radius * 2 * Math.PI;
        circle.style.strokeDasharray = `${circumference} ${circumference}`;
        circle.style.strokeDashoffset = `${circumference}`;
        const offset = circumference - percent / 100 * circumference;
        circle.style.strokeDashoffset = offset;
    }
</script>
<style>
    .timer{
        width:200px;
        height:200px;
        border-radius: 50%;
        background: #2e0d24;
        margin:0 auto;
        position: relative;
        z-index: 10;
        margin-top:20px;
        box-shadow: 0px 7px 2px 0 #2e0d24ee;
        display:flex;
        align-items: center;
        justify-content: center;
        font-size:7em;
        color:#fff;
        font-family:"BadaBoom";
    }
    .container-timer{
        width: 100%;
        height: 100%;
        border-radius: 50%;
        background: #2e0d24;
        margin: 0 auto;
        position: relative;
        z-index: 20;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #fff;
        font-family: "BadaBoom";
    }
    .timer.check{
        border-color:green;
    }
    .progress-ring-container {
        width:100%;
        height:100%;
        position: absolute;
        top:50%;
        left:50%;
        transform:translate(-50%,-50%);
       
    }
    .progress-ring-container svg{
        position: absolute;
        top:50%;
        left:50%;
        transform:translate(-50%,-50%);
    }
   .progress-ring-container svg circle{
        stroke:white;
    }
    .progress-ring-container svg circle.check.green{
        stroke:green;
    }

    .progress-ring-container svg circle.check.red{
        stroke:red;
    }

    .progress-ring-container svg circle.check.yellow{
        stroke:yellow;
    }
    

</style>