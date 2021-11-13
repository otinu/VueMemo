<template>
  <div id="app">
    <ul>
      <li v-for="memo in memos" :key="memo.id">
        {{ memo.title }}: {{ memo.description }}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      memos: "memos"  //setMemo内のthis.memos に対応
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
        this.memos = response.date
        ))
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
