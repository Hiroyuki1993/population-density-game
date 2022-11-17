<template>
  <div class="content">
    <h2 class="title">第{{this.quiz_completed+1}}/10問</h2>
    <div class="block">人口密度が高いのはどちらでしょうか？</div>
    <ul>
      <li>
        <button @click="answerQuiz" class="button is-primary is-large">
          {{ city1["city"] }}
        </button>
      </li>
      <li>
        <button @click="answerQuiz" class="button is-primary is-large">
          {{ city2["city"] }}
        </button>
      </li>
    </ul>
    <div v-if="answered" class="block">
      <article class="message is-success" v-if="corrected">
        <div class="message-header">正解です</div>
        <div class="message-body">
          <p>{{ city1["city"] }}：人口密度 {{ Number(city1["density"]).toLocaleString() }} 人 / ㎢ <br /> 
          {{ city2["city"] }}：人口密度 {{ Number(city2["density"]).toLocaleString() }} 人 / ㎢ </p>
        </div>
      </article>
      <article class="message is-warning" v-if="!corrected">
        <div class="message-header">不正解です</div>
        <div class="message-body">
          <p>{{ city1["city"] }}：人口密度 {{ Number(city1["density"]).toLocaleString() }} 人 / ㎢ <br /> 
          {{ city2["city"] }}：人口密度 {{ Number(city2["density"]).toLocaleString() }} 人 / ㎢ </p>
        </div>
      </article>
    </div>
    <button @click="shuffleCities" class="button is-primary is-light" v-if="answered">次の問題</button>
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
      if (this.answered) {
        return
      }
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
