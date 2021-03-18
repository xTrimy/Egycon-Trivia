<script>
    import { slide,fly} from "svelte/transition";
    import { writable } from "svelte/store";
    import { onMount } from "svelte";
    export let teamname;
    const score = writable(localStorage.getItem("score"+teamname) || 0);
    
    score.subscribe(val => localStorage.setItem("score"+teamname, val));
    function increase_score(){
        score.set(parseInt($score)+1);
    }
    function decrease_score(){
        if($score <=0)
            return;
        score.set(parseInt($score)-1);
    }
    export const score_functions = {
        clear_score(){
            score.set(0);
        }
    }
    let visible = false;
    onMount(() => {
		visible = true;
	});
</script>
{#if visible}
<div class="side {teamname}" in:slide="{{duration: 1400}}">
    <div class="team headline">{teamname} Team</div>
    <div class="score">
        <span class="score-number headline" >{$score}</span>
        <div class="score-buttons">
            <div on:click="{decrease_score}" class="decrease"></div>
            <div on:mousedown="{increase_score}" class="increase"></div>
        </div>
    </div>
    <div class="help-methods">
        <div class="search" in:fly="{{x:300*(teamname=="blue"?-1:1),duration: 1400}}"></div>
        <div class="audience dark" in:fly="{{x:300*(teamname=="blue"?-1:1),duration: 1900}}"></div>
        <div class="new dark" in:fly="{{x:300*(teamname=="blue"?-1:1),duration: 2200}}"></div>
        <div class="time" in:fly="{{x:300*(teamname=="blue"?-1:1),duration: 4000}}"></div>
    </div>
</div>
{/if}
<style>
.side{
    height:100%;
    position: absolute;
    top:0;
    left:0;
    width:200px;
    color:white;
    padding:50px 0;
}
.side.red{
    left:inherit;
    right:0;
}

.side .team{
    font-size:2.5em;
    text-align: center;
    font-family: "BadaBoom";
    text-shadow: 0px 5px 1px  #2e0d2499;
}

.side .score{
    width:100%;
    background-color: #005fb8;
    height:130px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size:6em;
    border:5px solid #fff;
    transform:skewX(-5deg) translateX(-10px);
    font-family: "BadaBoom";
    box-shadow: 0px 5px 1px 0 #2e0d2499;
}
.side .score .score-buttons{
    width:100%;
    position: absolute;
    top:calc(100% + 5px);
    display: flex;
    padding:0 40px;
    left:0;
    height: 20px;
}
.side .score .score-buttons div{
    width:30px;
    height:35px;
    margin:0 3px;
    background:#fff;
    z-index:-1;
    transform:skewY(10deg) translateY(-2.6px);
    position: relative;
    box-shadow: 0px 5px 3px 0 #2e0d2499;
}

.side .score .score-buttons div:nth-of-type(2){
    transform:skewY(-10deg) translateY(-2.6px);
}

.side .score .score-buttons div::after{
    content:"-";
    font-size:0.5em;
    position: absolute;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
    color:#2e0d24;
}
.side .score .score-buttons div.increase::after{
    content:"+";
}
.side .help-methods {
    margin-top:100px;
}
.side .help-methods div{
    width:180px;
    height:80px;
    margin-top:20px;
    transform:skewX(-15deg) translateX(-15px);
    background-color: #fff;
    position: relative;
}
.side .help-methods div.dark{
    transform:skewX(15deg) translateX(-15px);
    width:130px;
    background-color: #2e0d24;
}
.side.red .help-methods div{
    transform:skewX(-15deg) translateX(15px)
}
.side.red .help-methods div.dark{
    transform:skewX(15deg) translateX(15px)
}
.side .help-methods div::after{
    content:"";
    width:60px;
    height:60px;
    position: absolute;
    top:50%;
    right:30px;
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center;
    transform:skewX(15deg) translateY(-50%);
}
.side .help-methods div.dark::after{
    transform:skewX(-15deg) translateY(-50%);
}

.side.red .score{
    background-color:#e0032d;
    transform:skewX(5deg) translateX(10px)
}
.side.red .score .score-buttons{
    justify-content:flex-end;
}

.side.red .help-methods{
    direction: rtl;
}

.side.red .help-methods div::after{
    right:inherit;
    left:30px;
}

</style>