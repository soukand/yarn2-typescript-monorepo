import { info } from '@app/logger';

setInterval(() => {
	info('This is a log from api server');
}, 1000);
