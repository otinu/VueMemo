<template>
  <div id="app">
    <ul>
      <li v-for="memo in memos" :key="memo.id">
        {{ memo.title }}: {{ memo.description }}
      </li>
    </ul>
    <div>
      
      <!-- 下記の「data: function～～～」部分と繋がっている。初期値は空で返ってきて、フォーム入力をするとリアルタイムで値が格納される -->
      <input v-model="title" placeholder="title">
      <input v-model="description" placeholder="description">
      <button v-on:click="addMemo">メモを追加</button>  <!-- v-on でイベント発火時にJSの実行ができる -->
      <!-- <button @click="addMemo">メモを追加</button>  　　　　　　　　　省略系 -->
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      memos: "memos",
      title: '',
      description: '',
    }
  },
  mounted () {      //mounted()でアプリ起動のタイミングで関数を実行
    this.setMemo();
  },
  methods: {
    // 関数setMemoを定義
    setMemo: function () {
      axios.get('/api/memos') //axios.HTTPリクエスト(URL)で呼び出す
      .then(response => (
        this.memos = response.data))
    },
    addMemo: function() {
      axios.post('/api/memos', {
        title: this.title,
        description: this.description
      })
      .then(response => (
        this.setMemo()
        ));
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>