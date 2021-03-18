<script>
	import Bottom from './components/Bottom.svelte';
	import Container from './Container.svelte';
	import Side from './components/Side.svelte';
    let clear = false;
    let score;
    let score2;
    function clear_score(){
        score.clear_score();
        score2.clear_score();
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
    <div >
	<Container>
		<Side bind:score_functions={score} slot="team-1" teamname="blue"></Side>
		<Side bind:score_functions={score2} slot="team-2" teamname="red"></Side>
        <Bottom on:message={clear_score} slot="bottom"></Bottom>
	</Container>
    </div>
<style>
div{
    width:100%;
    height:100%;
}
</style>

