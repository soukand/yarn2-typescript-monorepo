import { logger } from '@app/logger';
import { fastify } from 'fastify';

const app = fastify({});

let counter = 1;

app.get<{ Reply: { count: number } }>('/visitsCounter', async (_req, res) => {
	res.header('Access-Control-Allow-Origin', '*');
	return {
		count: counter++,
	};
});

app.listen('5001');

logger.info('my-api server started on port 5001');
