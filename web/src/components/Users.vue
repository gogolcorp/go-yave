<script>
import { ref, onMounted, reactive } from "vue";
import axios from "axios";

export default {
  setup() {
    const users = ref([]);
    return {
      users
    };
  },
  mounted() {
    console.log(import.meta.env.DEV);
    axios
      .get(`${import.meta.env.VITE_API_BASE_URL}/users`)
      .then(response => {
        console.log(response.data);
        this.users = response.data;
      })
      .catch(error => console.log(error));
  }
};
</script>

<template>
  <div id="users">
    <ul>
      <li v-for="user in users" :key="user.id">
        ID: <span>{{ user.id }}</span
        ><br />
        NAME: <span>{{ user.name }}</span
        ><br />
        AGE: <span>{{ user.age }}</span>
      </li>
    </ul>
  </div>
</template>

<style lang="sass" scoped>
#users
  ul
    list-style: none
    display: flex
    li
      border: 2px #CAEB9A solid
      background: #DFF68E
      margin: 10px
      padding: 10px
      color: #FF7F86
      span
        color: #FF9A9F
        font-weight: bold
</style>
