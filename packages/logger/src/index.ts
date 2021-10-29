import _ from 'lodash';

export const info = (message: string): void => {
    console.log(new Date().toISOString(), _.toUpper(message));
}
