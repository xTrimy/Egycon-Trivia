

<script>
    import { createEventDispatcher } from 'svelte';
    const dispatch = createEventDispatcher();
    function Clear() {
        dispatch('message', {
            text: 'Clear!'
        });
    }
    import { writable } from "svelte/store";
    export const clear = writable(false);
</script>
<div class="footer">
    <div class="options">
        <div class='item punishment'></div>
        <div class='item winner'></div>
    </div>
    <img class="logo" src="layout/png/logo.png">
    <div class="options">
        <div class='item reset'></div>
        <div on:click="{Clear}" class='item hard-reset'></div>
    </div>
</div>