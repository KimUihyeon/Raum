import axios from "axios";


// 작성 규칙 - 마지막 슬래시 생략 할것 ..!
const dev_server : String = "http://localhost:8080";
const rel_server : String = "";



// real Connection String;
const server_connection_str = dev_server;



/**
 * 2020 . 03. 17 업그레이드 중..!!
 */
class AxiosUtil {

    private getUrl(url : string){
        return [server_connection_str, url].join('');
    }

    get(url : string){
        return axios.get(this.getUrl(url));
    }

    patch(url : string , data : any){
        return axios.patch(this.getUrl(url), {...data});
    }

    post(url : string , data : any){
        return axios.post(this.getUrl(url), {...data});
    }

    delete(url : string){
        return axios.delete(this.getUrl(url));
    }

}

export const axiosUtil = new AxiosUtil();