<script lang="ts">
export let name = 'Pablo';
export let visitorCount = 0;

fetch('http://localhost:5001/visitsCounter')
	.then(response => response.json() as Promise<{ count: number }>)
	.then(data => visitorCount = data.count);

</script>

{#if visitorCount}
	<main>
		<h1>Hello {name}!</h1>
		<p> You are visitor number {visitorCount}</p>
	</main>
{/if}

<style>
	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
	}
	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 2em;
		font-weight: 100;
	}
	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>
