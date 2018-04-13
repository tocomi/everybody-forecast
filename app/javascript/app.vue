<template>
  <table>
    <tr>
      <th>Name</th>
      <th>Comment</th>
      <th>Time</th>
    </tr>
    <tr v-for="item in groceryList">
      <td>{{ item.name }}</td>
      <td>{{ item.comment }}</td>
      <td>{{ item.time }}</td>
    </tr>
  </table>
</template>

<script>
export default {
  data: function () {
    return {
      groceryList: [
        { name: 'John', comment: 'Vegetables', time: '12:34' },
        { name: 'Mary', comment: 'Vebarage', time: '12:21' },
        { name: 'Mike', comment: 'Wall', time: '22:11' }
      ]
    }
  }
}
</script>

<style scoped>
table {
  writing-mode: horizontal-tb;
}
</style>
