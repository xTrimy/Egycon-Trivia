<script>
    import Answers from '../Answers.svelte';
    export let question_number;
	export let description;
	export let image = false;
    console.log(image);
	export let name;
	export let id;
    export let display;
    function close_question(){
        display = false;
    }
  
</script>
<div class="main-body">
            <div class="home">
                <div class="heading">Anime game show</div>
                <div class="questions-menu">
                </div>
            </div>
            <div class="question text">
                <div on:click="{close_question}" class="question-number">
                    <span>{question_number}</span>
                </div>
                {#if image != false}
                <div class="box-container">
                    <img src="question_images/{image}" alt={name}>
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
                <Answers question_id="{id}" ></Answers>
            </div>
        </div>
