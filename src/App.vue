<template>
  <div id="app">
    <router-link to="/component-study">コンポーネントへ</router-link>
    <router-view>
      <h1 slot="header">親から変更</h1>
    </router-view>
    <login></login>
    <ul>
      <li v-for="item in items" v-bind:key="item.name" >
        {{item.name}} の個数: <input type="number" v-on:input="item.quantity = $event.target.value " v-bind:value="item.quantity" min="0">
      </li>
    </ul>
    <div :style="errorMessageStyle">
      <ul>
        <li v-for="item in items" v-bind:key="item.name" >
          {{item.name }} : {{item.price}} x {{ item.quantity}}  =  {{item.price * item.quantity | numberWithDelimiter}} 円
        </li>
      </ul>
        <p>{{items[0].name }} : {{items[0].price}} x {{ items[0].quantity}} </p>
        <p>小計: {{ totalPrice | numberWithDelimiter }}円</p>
        <p>合計(税込): {{ totalPriceWithTax | numberWithDelimiter }}円</p>
        <p v-show="!canBuy">
          {{ 1000 | numberWithDelimiter }} 円以上からご購入いただけます
        </p>
        <button v-bind:disabled="!canBuy" v-on:click="doBuy">購入</button>
    </div>
  </div>
  
</template>

<script>
import login from "./components/molecules/Login.vue"

export default {
  data(){
    return {
      items :  [
        {
          name: '鉛筆',
          price: 300,
          quantity: 0
        },
        {
          name: 'ノート',
          price: 400,
          quantity: 0
        },
        {
          name: '消しゴム',
          price: 500,
          quantity: 0
        }
      ]
    }
  },
  filters:{
    numberWithDelimiter:function (value){
      if(!value){
        return '0'
      }
      return value.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,')
    }
  },
  methods:{
    doBuy: function(){
      alert(this.totalPriceWithTax + '円のお買い上げ！')
      this.items.forEach(function (sum ,item){
        item.quantity = 0 
      })
    }
  },
  computed:{
    totalPrice: function(){
      return this.items.reduce (function (sum,item){
        return sum + (item.price * item.quantity)
      }, 0)
    },
    totalPriceWithTax: function(){
      return Math.floor(this.totalPrice * 1.08)
    },
    canBuy: function() {
      return this.totalPrice >= 1000
    },
    errorMessageStyle: function () {
      return {
        border: this.canBuy ? '' :'1px solid red',
        color : this.canBuy ? '' :'red'
      }
    }
  },components:{
    login
  },
}

  
</script>