import { FC, SyntheticEvent, FocusEvent, useState } from "react";
import Autocomplete from "@mui/material/Autocomplete";

import ListItem from "@mui/material/ListItem";
import TextField from "@mui/material/TextField";

interface PropsSimpleAutocomplete {
  options: string[];
  placeholder: string;
  id?: string;
  value: string | null;
  onChange: (
    event: SyntheticEvent<Element, Event>,
    value: string | null
  ) => void;
  onBlur: (event: FocusEvent<HTMLInputElement>) => void;
  error?: { message?: string };
}
export const CustomAutocomplete: FC<PropsSimpleAutocomplete> = ({
  options,
  placeholder,
  id,
  value,
  onBlur,
  onChange,
  error,
}) => {
  const [inputValue, setInputValue] = useState("");
  return (
    <Autocomplete
      size="small"
      id={id}
      value={value || ""}
      inputValue={inputValue}
      onInputChange={(event, newInputValue) => {
        setInputValue(newInputValue);
      }}
      disableClearable
      onChange={onChange}
      onBlur={onBlur}
      options={options}
      isOptionEqualToValue={() => true}
      renderOption={(props, option, { selected }) => (
        <ListItem
          {...props}
          sx={{
            height: "32px",

            "&:hover": {
              backgroundColor: "#F0F8FF",
              color: "#0065C1",
            },
          }}
        >
          {option}
        </ListItem>
      )}
      renderInput={(params) => (
        <TextField
          {...params}
          placeholder={placeholder}
          FormHelperTextProps={{
            className: "m-0",
          }}
        />
      )}
      sx={{
        " .MuiOutlinedInput-root.MuiInputBase-sizeSmall": {
          paddingBottom: "4px",
          paddingTop: "4px",
        },
      }}
    />
  );
};
