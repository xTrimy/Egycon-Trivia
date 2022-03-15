<script>
import { fly } from 'svelte/transition';
import {onMount} from 'svelte';
let startAnimation = false;
onMount(() => {
		startAnimation = true;
	});
function reset_wheel(){
    document.querySelector('.wheel').style.transition = "unset";
    document.querySelector('.wheel').style.transform = "rotate("+ 0 +"deg)";
    setTimeout(function(){
        document.querySelector('.wheel').style.transition = "transform 8s";
    },40);
}
function animateWheel(){
    document.querySelector('#wheel_spinner_audio').currentTime = 0;
    
    reset_wheel();
    
    setTimeout(function(){
        console.log();
        document.querySelector('#wheel_spinner_audio').play();
        document.querySelector('.wheel').style.transform = "rotate("+ ((Math.random()*180+360)*(Math.random(10)+5)) +"deg)";
    },50)
}

document.addEventListener('keydown',function(e){
    if(e.key == " "){
        animateWheel();
    }
})
</script>
<!-- <audio src="layout/audio/finish-him.mp3" autoplay></audio> -->
<audio id="wheel_spinner_audio" src="layout/audio/wheel_spin.mp3"></audio>
{#if startAnimation}
<div class="punishment-background" in:fly="{{y:-300,duration: 1400}}">

</div>
{/if}
<div class="main-body">
            <div class="home">
                <div class="heading">
                    <img src="../layout/png/text.png" alt="">
                </div>
            </div>
            <div class="character">

            </div>
            <div class="wheel" on:click={animateWheel} ></div>
        </div>

<style>
    .home .heading{
        font-size:8em;
    }
    .main-body{
        padding-top:50px;
    }
    .punishment-background{
        width:100%;
        position:absolute;
        top:0;
        left:0;
        height:300px;
        z-index: 0;
        /* background-image:url('../layout/png/punishment-back.png'); */
        background-size: contain;
        opacity:0.4
    }
    .character{
        position: absolute;
        bottom:-300px;
        right:200px;
        width:600px;
        height:1100px;
        background-image:url(../layout/png/punishment-character.png);
        background-size: contain;
        background-repeat: no-repeat;
        z-index: 10;
    }
    .wheel{
        width:700px;
        height:700px;
        position: absolute;
        bottom:100px;
        left:90px;
        border-radius: 50%;
        background-image:url(../layout/png/punishment-wheel.png);
        background-size: contain;
        background-repeat: no-repeat;
        transition:transform 8s;
        transform:rotate(0)
    }
    

</style>