

<script>
    import { createEventDispatcher } from 'svelte';
    const dispatch = createEventDispatcher();

    export let n_used = false;
    export let punishment_display = true;
    function toggle_new_used(force_off = false){
        if(force_off === true)
            n_used = true;
        n_used = !n_used;
        setTimeout(() => {
            punishment_display = false;
        }, 800);
    }
   
    function Clear() {
        dispatch('clear_score', {
            text: 'Clear!'
        });
    }
    function open_punishment() {
        dispatch('open_punishment', {
            text: 'Clear!'
        });
    }
    function open_winner() {
        if(punishment_display)
        open_punishment()
        dispatch('open_winner', {
            text: 'Clear!'
        });
    }
    import { writable } from "svelte/store";
    export const clear = writable(false);

    function ClearAll() {
        dispatch('clear_score', {
            text: 'Clear!'
        });

        const removeSelect = (async () => {
            const response = await fetch('http://localhost/egycon_trivia_svelte/server/question/removeSelect.php');
            return await response.json();
        })()
    }

     if(!document.body.getAttribute('data-random_q')){
        document.body.setAttribute('data-random_q',true);
        document.addEventListener('keydown',function(e){
            if(e.key == "1"){
                open_punishment();
            }
            if(e.key == "a"){
                toggle_new_used();
            }
        })
     }
     
</script>

<div class="footer">
    <div style="width:150px; height:200px; position:absolute; bottom:100px; right:75px;">
        <img src="layout/png/powered-by.png" style="width:100%; height:100%; object-fit:contain; object-position:center;" alt="">
    </div>
    <div class="options" style="position:relative:z-index:99999">
        <div on:click="{open_punishment}" class='item punishment'></div>
        <div on:click="{open_winner}" class='item winner'></div>
        <div on:click="{Clear}" class='item reset'></div>
        <div on:click="{ClearAll}"  class='item hard-reset'></div>


        <div on:click="{toggle_new_used}" class='item '></div>
        <!-- <div on:click="{open_winner}" class='item winner'></div>
        <div on:click="{Clear}" class='item reset'></div>
        <div on:click="{ClearAll}"  class='item hard-reset'></div> -->
    </div>
    <img class="logo" src="layout/png/logox.png" alt="Egycon Logo">
    <div style="display:flex; " >
       
        <div style="width:200px;height:200px;">
            <img src="layout/png/kata-kito.png" style="width:100%; height:100%; object-fit:contain; object-position:center;" alt="">
        </div>
    </div>
</div>