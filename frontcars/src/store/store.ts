import { configureStore } from "@reduxjs/toolkit";
import carsSlice from "./slices/carsSlice";
import userSlice from "./slices/userSlices";

const store = configureStore({
  reducer: {
    user: userSlice,
    cars: carsSlice,
  },
});

export default store;

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
