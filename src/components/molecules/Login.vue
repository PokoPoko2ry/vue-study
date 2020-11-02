<template >
    <div id="login">
        <div>
            <input type="text" placeholder="ログインID" v-model="userid" />
        </div>
        <div>
            <input type="password" placeholder="パスワード" v-model="password" /><br/>
            <button @click="login()">ログイン</button>
        </div>
    </div>
</template>

<script>
export default{
    data () {
        return {
            userid : '',
            password : ''
        }
    },
    methods:{
        login () {
            auth.login(this.userid , this.password);
        }
    }
}

var auth = {
    login: function(userid ,pass){
        window.alert("userid:" + userid + "password" +  pass );
    }
}
</script>