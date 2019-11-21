<template>
  <v-app>
    <v-app-bar app color="primary" dark prominent src="https://cdn.vuetifyjs.com/images/backgrounds/vbanner.jpg" height="70px">
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title class="headline text-uppercase">
        <v-icon>mdi-airplane-takeoff</v-icon>
        <span>Fiji</span>
        <span class="font-weight-light">Travel</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon to="/about">
        <v-badge color="orange">
          <template v-slot:badge>
            <span>3</span>
          </template>
          <v-icon>mdi-cart</v-icon>
        </v-badge>
      </v-btn>
    </v-app-bar>

    <v-card>
      <v-navigation-drawer app v-model="drawer">
        <v-list v-if="!guest" class="text-center">
          <v-list-item-avatar>
            <v-img src="https://randomuser.me/api/portraits/men/78.jpg"></v-img>
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title>Nemesio R. Raitubu</v-list-item-title>
          </v-list-item-content>
          <v-divider></v-divider>
        </v-list>
        <div class="pa-2" v-if="guest">
          <v-btn block color="primary" class="mb-1" @click="setDialogComponent('login')">
            <v-icon left>mdi-lock</v-icon>Login
          </v-btn>
          <v-btn block color="success">
            <v-icon left>mdi-account</v-icon>Register
          </v-btn>
        </div>
        <v-list>
          <v-list-item v-for="(item, index) in menus" :key="`menu-`+index" :to="item.route">
            <v-list-item-icon>
              <v-icon left>{{ item.icon }}</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-navigation-drawer>
    </v-card>
    <v-content>
      <!-- <HelloWorld /> -->
      <v-container fluid>
        <router-view></router-view>
      </v-container>
    </v-content>

    <v-card>
      <v-footer absolute app>
        <v-card-text class="text-center">
          &copy; {{new Date().getFullYear()}} -
          <strong>Fiji Travel</strong>
        </v-card-text>
      </v-footer>
    </v-card>
  </v-app>
</template>





<script>
// import Login from "./components/Login";

export default {
  name: "App",
  data: () => ({
    drawer: false,
    menus: [
      { title: "Home", icon: "mdi-home", route: "/" },
      { title: "My Booking", icon: "mdi-file-document", route: "/about" },
      { title: "My Account", icon: "mdi-account", route: "/myaccount" },
      { title: "About", icon: "mdi-information", route: "/about" }
    ],
    guest: true
  })
};
</script>
