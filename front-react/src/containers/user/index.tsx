
import { ConsultingMain } from "./ConsultingMain";
import { ConsultingFaQ } from "./ConsultingFaQ";
import { ConsultingAS } from "./ConsultingAS";
import { Custom } from "./Custom";

import { InfoRaum } from "./InfoRaum";
import { InfoStory } from "./InfoStory";
import { InfoFactory } from "./InfoFactory";

import { Object } from "./Object";
import { Main } from "./Main";
import { ShowRoom } from "./ShowRoom";

export type stackInstances = typeof ConsultingMain | typeof ConsultingFaQ | typeof ConsultingAS | typeof Custom |
                            typeof InfoRaum | typeof InfoStory | typeof InfoFactory |
                            typeof Main | typeof Object | typeof ShowRoom;

export default {
    ConsultingMain,
    ConsultingFaQ,
    ConsultingAS,
    Custom,
    InfoRaum,
    InfoStory,
    InfoFactory,

    Main,
    Object,
    ShowRoom,
} as {
    [key: string]: stackInstances
  };


