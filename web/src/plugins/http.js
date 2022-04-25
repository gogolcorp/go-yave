import axios from "axios";
import Vue from "vue";

export default {
  install() {
    Vue.prototype.$http = axios.create({
      baseURL: `${import.meta.env.VITE_API_BASE_URL}/`,
      headers: {
        "Content-Type": "application/json"
      }
    });
  }
};
