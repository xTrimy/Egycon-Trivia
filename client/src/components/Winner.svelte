<script>
import { fly } from 'svelte/transition';
import {onMount} from 'svelte';

let red_team_score = localStorage.getItem("score-red") || 0;
let blue_team_score = localStorage.getItem("score-blue") || 0;

let winner_team = (red_team_score>blue_team_score)?"RED":"BLUE";
let startAnimation = false;
onMount(() => {
		startAnimation = true;
	});

</script>

<div class="main-body">
            <div class="home">
                <div class="heading">WINNER</div>
                <div class="heading">{winner_team} TEAM</div>
            </div>
            
        </div>

<style>
    .home .heading{
        font-size:8em;
    }
    .main-body{
        padding-top:50px;
    }
    

</style>