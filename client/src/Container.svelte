  <script>
    import Menu from './components/Menu.svelte';
  </script>
  <div class="wrapper question-background">
        <slot name="team-1"></slot>
        <slot name="team-2"></slot>
			<Menu></Menu>
        <slot name="bottom"></slot>
    </div>