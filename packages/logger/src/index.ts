import _ from 'lodash';

export const info = (message: string): void => {
	// eslint-disable-next-line no-console
	console.log(new Date().toISOString().split('T')[1].split('.')[0], _.startCase(message));
};
