enum lType { UI, Main };
enum action { INSERT , UPDATE, DELETE, CREATE, SELECT, SELECTONE }

const str_joinner = (...str : string[]) : string => {
    return str.join('_');
}

export const main = str_joinner(lType[lType.Main].toString(), action[action.CREATE].toString());