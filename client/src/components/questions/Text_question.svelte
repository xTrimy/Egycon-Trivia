<script>
    import Answers from '../Answers.svelte';
    export let question_number;
	export let description;
	export let image = false;
    console.log(image);
	export let name;
	export let id;
    export let display;
    export let wrong_choice = false;
    export let right_choice = false;
    export let time;
    function close_question(){
        display = false;
        right_choice = false;
        wrong_choice = false;
    }
    const select_question = (async () => {
		const response = await fetch('http://localhost/egycon_trivia_svelte/server/question/select.php?id='+id);
    return await response.json();
	})()
    if(!document.body.getAttribute('data-video_'))
    document.addEventListener('keydown',function(e){
    document.body.setAttribute('data-video_',true);
        if(e.key == " "){
            let video = document.getElementById('q_video');
            if(video.paused){
                document.getElementById('q_video').play();
            }else{
                document.getElementById('q_video').pause();
            }
        }
    });
</script>
<div class="main-body">
            <div class="home">
                    {#if image != false}
                    <div class="heading2" >
                        {description}
                    </div>
                    {:else}
                    <div class="heading" >
                            Trivia Game Show
                    </div>
                    {/if}
                <div class="questions-menu">
                </div>
            </div>
            <div class="question text">
                <div on:click="{close_question}" class="question-number">
                    <span>{question_number}</span>
                </div>
                {#if image.indexOf('.mp4') != -1}
                <div class="box-container" style="position:relative;">
                    
                    <video id="q_video" width="70%" alt={name} autoplay loop onload="this.focus()" >
                          <source src="layout/image/{image}" type="video/mp4">
                          Your browser does not support the video tag.
                    </video>
                </div>
                {:else if image != false}
                <div class="box-container" style="position:relative;">
                    
                    <img src="layout/image/{image}" alt={name}>
                </div>
                {:else}
                <div class="question-container">
                    <div class="question-box">
                        <div class="shapes"></div>
                        <div class="shapes question-character"></div>
                        <span>{description}</span>
                    </div>
                </div>
                {/if}
                <Answers bind:time bind:right_choice bind:wrong_choice question_id="{id}" ></Answers>
            </div>
        </div>
<style>

.main-body .home .heading::before{
    position:absolute;
    content:"";
    width: 50px;
    height: 50px;
    background-image: url(../layout/png/heading-shape.png);
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
    top:-30px;
    left:-20px;
}
.main-body .home .heading2{
    font-size:3em;
    color:white;
    text-align:center;
    font-family: "BadaBoom";
    text-shadow: 0px 9px 2px  #2e0d24bb;
    position: relative;
    display:table;
    margin:0 auto;
    margin-bottom:20px;
    font-family: "helvetica-neue";
    
}
</style>