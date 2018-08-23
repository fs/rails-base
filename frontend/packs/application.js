import importAll from 'helpers/importAll';
import 'stylesheets/application.scss';

importAll(require.context('initializers', true, /\.js$/));
