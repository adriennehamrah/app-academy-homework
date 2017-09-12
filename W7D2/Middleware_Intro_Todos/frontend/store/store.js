import { createStore, applyMiddleware } from 'redux';
import RootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    RootReducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatch, addHiMiddleware)
  );


  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
    console.log('State pre-dispatch:', store.getState());
    console.log('Action:', action);
    console.log('Next in addLogging:', next);
    next(action);
    console.log('State post-dispatch', store.getState());
};

const addHiMiddleware = store => next => action => {
  console.log('This is the HI middleware');
  console.log('Next in HiMiddleware:', next);
  next(action);
};

export default configureStore;
