<script>
    import { writable } from 'svelte/store';
    import { fade,fly } from 'svelte/transition';
    import { quintOut } from 'svelte/easing';
    import { crossfade } from 'svelte/transition';

  	import Text_question from './questions/Text_question.svelte';
  	import Punishment from './Punishment.svelte';
    import Winner from './Winner.svelte';
    export let update_question = false;
    export let time;
    export let selected_questions = [];
    
    export let questions_count = 0;
    export let questions_data;
    const questions = (async () => {
		const response = await fetch('http://localhost/egycon_trivia_svelte/server/question/read.php');
          
    return await response.json();
	})()
    export let answers;
    const questions_records = (async () => {
		const response = await questions;
    return await response['records'];
	})()
    

//     const questions_records = {
//     "records":[
//         {
//             "id": 1,
//             "name": "Test",
//             "description": "Test Test",
//             "image": "0"
//         }
//     ]
// }['records'];
   export const q_data = writable(0);
   export const q_number = writable(0);
   export let q_n;
   export let question_display = false;
   export let punishment_display = true;
   export let winner_display = false;

    export let wrong_choice = false;
    export let right_choice = false;
    (async () => {
        
        console.log(await questions_records);
        questions_data = await questions_records;
        questions_count = questions_data.length;
        for(let i = 0; i < questions_data.length;i++){
            if(questions_data[i].selected == 1){
                selected_questions.push(i+1);
            }
        }
    })()
    let question_random = 0;
   $: if(update_question){
       question_random = Math.floor(Math.random() * questions_count);
       let i = 0;
       while(selected_questions.indexOf(question_random+1) != -1 && i < questions_count){
            question_random = Math.floor(Math.random() * questions_count);
            i++;
       }
       setTimeout(() => {
        right_choice = false;
        wrong_choice = false;
        q_data.set(questions_data[question_random]);
        q_number.set(question_random+1); question_display=true;
        update_question = false;
       }, 1000);
        
   }
   $: q_n = $q_number;
</script> 
{#if punishment_display}
    <Punishment/>
{:else if winner_display}
    <Winner ></Winner>
{:else if !question_display}
    <div class="questions-menu" in:fade="{{duration: 1400,easing: quintOut }}">
        {#await questions_records}
        <p>...Loading</p>
        {:then data}
            {#each data as question,i}
                <div class="item" on:contextmenu|preventDefault="" value="{i}" class:selected="{((selected_questions.indexOf(i) > -1 && $q_number != 0) || question.selected == 1)}" on:click|once="{function(){q_data.set(question);q_number.set(i); question_display=true;}}">{++i}</div>
            {/each}
        {:catch error}
            <p>An error occurred!{error}</p>
        {/await}
    </div>
{:else}
    <div in:fade="{{duration: 200 }}">
        <Text_question bind:time bind:right_choice bind:wrong_choice bind:display="{question_display}" {...$q_data} question_number="{$q_number}"></Text_question>
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
} 

.questions-menu .item.selected{
    opacity:0.3;
}

</style>