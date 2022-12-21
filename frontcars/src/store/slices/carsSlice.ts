import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import { carsApi } from "../../services/CarsService";

export const fetchCars = createAsyncThunk("cars/fetchCars", () => {
  const newCars = carsApi.getCars();
  return newCars;
});
export const fetchDetails = createAsyncThunk<any, string>(
  "cars/fetchDetails",
  async (id) => {
    const carDetails = await carsApi.getCar(id);
    return carDetails;
  }
);
export const fetchBrand = createAsyncThunk<any, string>(
  "cars/fetchBrand",
  async () => {
    const brand = await carsApi.getBrand();
    return brand;
  }
);
export const fetchBrandAndModel = createAsyncThunk<any, string>(
  "cars/fetchBrandAndModel",
  async (brand) => {
    const cars = await carsApi.getBrandAndModel(brand);
    return cars;
  }
);

const initialState = {
  cars: [],
  status: "idle",
} as any;

const carsSlice = createSlice({
  name: "cars",
  initialState,
  reducers: {
    unsetList: (state) => {
      state.cars = [];
    },
  },
  extraReducers: (builder) => {
    builder.addCase(fetchCars.pending, (state) => {
      state.status = "loading";
    });
    builder.addCase(fetchCars.fulfilled, (state, action) => {
      state.status = "success";
      state.cars = action.payload;
    });
    builder.addCase(fetchCars.rejected, (state) => {
      state.status = "error";
    });

    builder.addCase(fetchDetails.pending, (state) => {
      state.status = "loading";
      state.error = null;
    });
    builder.addCase(fetchDetails.fulfilled, (state, action) => {
      state.result = action.payload;
      state.status = "success";
    });
    builder.addCase(fetchDetails.rejected, (state) => {
      state.status = "loading";
      state.error = null;
    });

    builder.addCase(fetchBrand.pending, (state) => {
      state.status = "loading";
    });
    builder.addCase(fetchBrand.fulfilled, (state, action) => {
      state.status = "success";
      state.cars = action.payload;
    });
    builder.addCase(fetchBrand.rejected, (state) => {
      state.status = "error";
    });

    builder.addCase(fetchBrandAndModel.pending, (state) => {
      state.status = "loading";
    });
    builder.addCase(fetchBrandAndModel.fulfilled, (state, action) => {
      state.status = "success";
      state.cars = action.payload;
    });
    builder.addCase(fetchBrandAndModel.rejected, (state) => {
      state.status = "error";
    });
  },
});
export const { unsetList } = carsSlice.actions;
export default carsSlice.reducer;
