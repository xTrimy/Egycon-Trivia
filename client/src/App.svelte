<script>
	import Bottom from './components/Bottom.svelte';
	import Container from './Container.svelte';
	import Side from './components/Side.svelte';
import { writable } from 'svelte/store';
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
    let punishment_display = false;
    function open_punishment(){
        punishment_display = !punishment_display;
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
	<Container bind:punishment_display={punishment_display}>
		<Side bind:score_functions={score} on:message="{team_1_turn_on}" bind:team_turn={team1_turn} slot="team-1" teamname="blue"></Side>
		<Side bind:score_functions={score2} on:message="{team_2_turn_on}" bind:team_turn={team2_turn} slot="team-2" teamname="red"></Side>
        <Bottom on:open_punishment={open_punishment} on:clear_score={clear_score} slot="bottom"></Bottom>
	</Container>
    </div>
<style>
div{
    width:100%;
    height:100%;
}
</style>

