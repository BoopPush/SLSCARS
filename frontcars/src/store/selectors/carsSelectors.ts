import { RootState } from "../store";

export const getCars = (state: RootState) => state.cars.cars;
