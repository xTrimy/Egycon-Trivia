<script>
    import { writable } from 'svelte/store';
    import { fade,fly } from 'svelte/transition';
    import { quintOut } from 'svelte/easing';
    import { crossfade } from 'svelte/transition';

  	import Text_question from './questions/Text_question.svelte';
    const questions = (async () => {
		const response = await fetch('http://localhost/egycon_trivia_svelte/server/question/read.php');
        
    return await response.json();
	})()
    const questions_records = (async () => {
		const response = await questions;
        
    return await response['records'];
	})()
   export const q_data = writable(0);
   export const q_number = writable(0);
   export let question_display = false;
</script> 

{#if !question_display}
    <div class="questions-menu" in:fade="{{duration: 1400,easing: quintOut }}">
        {#await questions_records}
        <p>...Loading</p>
        {:then data}
            {#each data as question,i}
                <div class="item" on:click="{function(){q_data.set(question);q_number.set(i); question_display=true;}}">{++i}</div>
            {/each}
        {:catch error}
            <p>An error occurred!{error}</p>
        {/await}
    </div>
{:else}
    <div in:fade="{{duration: 200 }}">
        <Text_question bind:display="{question_display}" {...$q_data} question_number="50"></Text_question>
    </div>
{/if}
<style>
.questions-menu{
    display:flex;
    flex-wrap: wrap;
    width:calc(140px * 10);
    max-width: 100%;
    margin:0 auto;
    margin-top:80px;
    justify-content: center;
}
.questions-menu .item{
    background:linear-gradient(rgba(106,29,87,0.8),rgba(11,0,8,0.8));
    width:120px;
    height:100px;
    margin:10px;
    color:white;
    font-size:5em;
    display: flex;
    align-items:center;
    justify-content: center;
    font-family: "BadaBoom";
    box-shadow: 0px 4px 10px 1px #2e0d2499;
    text-shadow: 2px 9px 2px  #2e0d24bb;
    cursor: pointer;
} 
</style>