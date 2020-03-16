import { Object } from "./Object";
import { Main } from "./Main";
import { ShowRoom } from "./ShowRoom";

export type stackInstances = typeof Main | typeof Object | typeof ShowRoom;

export default {
    Main,
    Object,
    ShowRoom,
} as {
    [key: string]: stackInstances
  };


