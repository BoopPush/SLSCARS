import { createSlice } from "@reduxjs/toolkit";

interface IUserStore {
  isAuthorized: string | null | void;
  email: string | undefined;
  name: string | undefined;
}

const initialState: IUserStore = {
  isAuthorized: localStorage.getItem("user"), //change!
  email: undefined,
  name: undefined,
};

const userSlice = createSlice({
  name: "user",
  initialState,
  reducers: {
    setUser: (state, action) => {
      state.isAuthorized = localStorage.getItem("user");
      state.email = action.payload;
    },
    unsetUser: (state) => {
      state.isAuthorized = localStorage.removeItem("user");
      state.email = undefined;
    },
    setUserName: (state, action) => {
      state.name = action.payload;
    },
  },
});
export const { setUser, unsetUser, setUserName } = userSlice.actions;
export default userSlice.reducer;
