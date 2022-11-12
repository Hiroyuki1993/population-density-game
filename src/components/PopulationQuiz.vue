<template>
  <div class="quiz">
    <h3>どちらが多いでしょう？</h3>
    <ul>
      <li><button>{{ city1 }}</button></li>
      <li><button>{{ city2 }}</button></li>
    </ul>
    <p>正解です！</p>
    <p>{{ city1 }}：人口密度 xxx / ㎢ <br /> 
    {{ city2 }}：人口密度 xxx / ㎢ </p>
    <button>次の問題</button>
  </div>
</template>

<script>
export default {
  name: 'PopulationQuiz',
  props: {
    city1: String,
    city2: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
