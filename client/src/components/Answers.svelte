<script>
    import Timer from './Timer.svelte';
    export let question_id;
    let is_right = [];
    let ready = [0,0,0,0];
    export let right_choice = false;
    export let wrong_choice = false;
    const answers = (async () => {
		const response = await fetch('http://localhost/egycon_trivia_svelte/server/answer/read.php?question_id='+question_id);
		// const response = await fetch('./answers.json',{
        //   headers : { 
        //     'Content-Type': 'application/json',
        //     'Accept': 'application/json'
        //    },
        //    mode: 'no-cors'
        //  });
        const responseJson = await response.json();

    return await responseJson;
	})()
	answers.then(response => {
            let records = response;
            for(let i = 0; i<records.length; i++){
                records[i].ready = false;
                is_right.push(records[i].is_right);
            }
            console.log(records);
            return records;
        }
    );
//     const answers = [
//         {
//             "id": "4",
//             "answer": "Test4",
//             "question_id": "1",
//             "is_right": 0,
//             "ready":false
//         },
//         {
//             "id": "1",
//             "answer": "Test1",
//             "question_id": "1",
//             "is_right": 1,
//             "ready":false
//         },
//         {
//             "id": "2",
//             "answer": "Test2",
//             "question_id": "1",
//             "is_right": 0,
//             "ready":false
//         },
//         {
//             "id": "3",
//             "answer": "Test3",
//             "question_id": "1",
//             "is_right": 0,
//             "ready":false
//         }
// ];
    function setReady(i){
        stop_timer();
        right_choice = false;
        wrong_choice = false;
        if(ready[i]){
            if(is_right[i] != false){
                right_choice = true;
            }
            else{
                wrong_choice = true;
            }
            return;
        }
        ready = [0,0,0,0];
        ready[i] = true;
        console.log(ready);
    }

    let timer;
    function stop_timer(){
        timer.stop_timer();
    }
</script>

<div class="answers-container">
    <Timer bind:timer_functions={timer}></Timer>
    {#await answers}
        <p>...Loading</p>
    {:then data}
        {#if data.length == 4}
        <div class="answers">
            {#each data as answer,i}
                <div on:click="{()=>setReady(i)}"  class:right_choice_force={(answer.is_right === '1')} class:right_choice class:wrong_choice class:ready="{ready[i]}">{answer.answer}</div>
            {/each}
        </div>
        {/if}
    {:catch error}
        <p>An error occurred!{error}</p>
    {/await}

</div>

<style>
.answers-container{
    position:relative;
    width:100%;
    height:250px;
}
.answers-container .answers{
    width:85%;
    height: 170px;
    position: absolute;
    top:15px;
    left:50%;
    transform:translateX(-50%);
    color:white;
}
.answers-container .answers div{
    font-size:3.5em;
    display:flex;
    align-items:center;
    justify-content: center;
    font-weight: bold;
}


.answers-container .answers div{
    position:absolute;
    top:0;
    left:0;
    width: calc(50% - 100px);
    height:100px;
    background-color: #2e0d24;
}
.answers-container .answers div.ready{
    background-color:#e3c000;
}
.answers-container .answers div.ready.right_choice,.answers-container .answers div.right_choice_force.wrong_choice{
    background-color:#01ce40;
}
.answers-container .answers div.ready.wrong_choice{
    background-color:#f04747;
}
.answers-container .answers div:nth-of-type(2){
    top:105px;
}
.answers-container .answers div:nth-of-type(3){
    left:inherit;
    right:0;
    transform:translateX(100px);
}
.answers-container .answers div:nth-of-type(4){
    left:inherit;
    right:0;
    top:105px;
    transform:translateX(100px);
}
    
    /*background-color:#01ce40;  */
</style>