<template>
  <div class="quiz">
    <h2>第{{this.quiz_completed+1}}/10問</h2>
    <h3>どちらが多いでしょう？</h3>
    <ul>
      <li><button @click="answerQuiz">{{ city1["city"] }}</button></li>
      <li><button @click="answerQuiz">{{ city2["city"] }}</button></li>
    </ul>
    <div v-if="answered">
      <p v-if="corrected">正解です！</p>
      <p v-if="!corrected">不正解です</p>
      <p>{{ city1["city"] }}：人口密度 {{ city1["density"] }} / ㎢ <br /> 
      {{ city2["city"] }}：人口密度 {{ city2["density"] }} / ㎢ </p>
    </div>
    <button @click="shuffleCities">次の問題</button>
  </div>
</template>

<script>
import populations from '@/assets/population.json'

export default {
  name: 'QuizPage',
  props: {
  },
  data () {
    const shuffled = populations.sort(() => 0.5 - Math.random());
    let selected = shuffled.slice(0,2);
    return {
      city1: selected[0],
      city2: selected[1],
      quiz_completed: 0,
      quiz_corrected: 0,
      answered: false,
      corrected: false,
    }
  },
  methods: {
    shuffleCities: function() {
      // populations からランダムに２つの区を取り出す
      const shuffled = populations.sort(() => 0.5 - Math.random());
      let selected = shuffled.slice(0,2);
      // 既存のcityと変わらなければ変更
      if ((this.city1["city"] == selected[0]["city"]) && (this.city2["city"] == selected[1]["city"])) {
        selected = shuffled.slice(2,4)
      }
      if ((this.city2["city"] == selected[0]["city"]) && (this.city1["city"] == selected[1]["city"])) {
        selected = shuffled.slice(2,4)
      }
      // 既存のcityを更新する
      this.city1 = selected[0]
      this.city2 = selected[1]
      // 回答数を１増やす
      this.quiz_completed++
      if (this.quiz_completed == 10) {
        this.$emit("parentMethod", 2)
        this.$emit("updateScore", this.quiz_corrected)
      }
      this.answered = false;
    },
    answerQuiz: function(event) {
      this.answered = true;
      // 正誤判定
      if (this.city1["density"] > this.city2["density"]) {
        if (this.city1["city"] == event.target.innerText) {
          this.corrected = true
          this.quiz_corrected++
        } else {
          this.corrected = false
        }
      }
      if (this.city2["density"] > this.city1["density"]) {
        if (this.city2["city"] == event.target.innerText) {
          this.corrected = true
          this.quiz_corrected++
        } else {
          this.corrected = false
        }
      }
    }
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
