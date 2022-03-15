<script>
	import Bottom from './components/Bottom.svelte';
	import Container from './Container.svelte';
	import Side from './components/Side.svelte';
    import { writable } from 'svelte/store';

    let n_used = false;


    let search_used = false;
    let audiance_used = false;
    let new_question_used = false;
    let add_time_used = false;

    let search_used_2 = false;
    let audiance_used_2 = false;
    let new_question_used_2 = false;
    let add_time_used_2 = false;

    
    let clear = false;
    
    let score;
    let score2;
    function clear_score(){
        score.clear_score();
        score2.clear_score();
    }
    let team1_turn;
    let team2_turn;
    function team_1_turn_on(){
        score.team_turn_on();
        score2.team_turn_off();
    }
    function team_2_turn_on(){
        score2.team_turn_on();
        score.team_turn_off();
    }
    let punishment_display = true;
    let winner_display = false;
    function open_punishment(){
        punishment_display = !punishment_display;
    }
    function open_winner(){
        winner_display = !winner_display;
    }
    $: if(new_question_used){
        console.log(new_question_used);
    }

    $: if(n_used){
        n_used = true;
    }
</script>
<svelte:head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Egycon Trivia</title>
    <link rel="stylesheet" href="layout/css/badaboom.css">
    <link rel="stylesheet" href="layout/css/helvetica-font.css">
    <link rel="stylesheet" href="layout/css/head_line_arabic.css">
    <link rel="stylesheet" href="layout/css/head_line_english.css">
    <link rel="stylesheet" href="layout/css/master.css">
</svelte:head>
    <div>
	<Container
    bind:search_used
    bind:time_used={add_time_used}
    bind:audiance_used
    bind:new_used={new_question_used}
    bind:n_used={n_used}
    bind:winner_display={winner_display}
    bind:punishment_display={punishment_display}
    bind:score
    bind:score2
    >
		<Side bind:s_used ={search_used}
              bind:a_used={audiance_used}
              bind:n_used={new_question_used}
              bind:t_used={add_time_used} 
              bind:score_functions={score} 
              on:message="{team_1_turn_on}" 
              bind:team_turn={team1_turn} 
              slot="team-1" teamname="blue">
        </Side>
		<Side bind:s_used={search_used}
              bind:a_used={audiance_used}
              bind:n_used={new_question_used}
              bind:t_used={add_time_used} 
              bind:score_functions={score2} 
              on:message="{team_2_turn_on}" 
              bind:team_turn={team2_turn} 
              slot="team-2" teamname="red">
        </Side>
        <Bottom bind:punishment_display={punishment_display} bind:n_used={n_used} on:open_winner={open_winner} on:open_punishment={open_punishment} on:clear_score={clear_score} slot="bottom"></Bottom>
	</Container>
    </div>
<style>
div{
    width:100%;
    height:100%;
}
</style>

