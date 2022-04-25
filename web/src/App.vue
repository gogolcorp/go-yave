<script setup>
import Users from "./components/Users.vue";
</script>

<template>
  <section id="app">
    <div class="wrapper">
      <img alt="Vue logo" src="./assets/logo.png" width="250" />
      <div class="titles">
        <h1>Go-yave</h1>
        <h2>A clean and complete ready-to-use repository template</h2>
        <p>
          with conventions, guidelines, project folder structure, Dockerization,
          CI/CD, labeler, releaser, automation [...] and some more.
        </p>
      </div>
    </div>
    <Users />
  </section>
</template>

<style lang="sass">
#app
  font-family: Avenir, Helvetica, Arial, sans-serif
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  text-align: center
  color: #2c3e50
  margin-top: 20px
  .wrapper
    display: flex
    justify-content: flex-start
    .titles
      display: flex
      flex-direction: column
      align-content: flex-start
      h1, h2
        display: flex
        font-size: 36px
        margin: 10px 0
      h2
        font-size: 20px
      p
        font-size: 16px
</style>
