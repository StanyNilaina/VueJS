<template>
     <v-container class="todoapp">
         <v-card color="teal darken-2">
            <v-container class="header">
                <v-text-field name="name" label="Ajouter une tâche" v-model="newTodo" @keyup.enter="addTodo" id="id"></v-text-field>
            </v-container>
            <v-container class="main">
                <v-checkbox label="Finish all" v-model="allDone" hide-details></v-checkbox>
                <v-card dark> 
                    <v-list class="todo-list">
                        <v-list-item class="todo" v-for="todo in filterredTodos" :key="todo.id" :class="{completed: todo.completed}">
                            <v-list-item-subtitle >
                                <input type="checkbox" v-model="todo.completed">
                            </v-list-item-subtitle>
                            <v-list-item-header align-center class="mr-2" > 
                                <v-container>
                                    <h3 @dblclick="editTodo(todo)">{{ todo.nom }}</h3>
                                </v-container>
                                <v-divider></v-divider>
                            </v-list-item-header>
                            <v-list-subheader>
                                <button @click.prevent="deleteTodo(todo)">X</button>
                            </v-list-subheader>
                            <input type="text" v-model="todo.nom" v-if="todo == editing" @keyup.enter="doneEdit">
                        </v-list-item>
                    </v-list>
                </v-card>
            </v-container>
            <v-container class="footer" v-show="todos.length > 0" >
                <div class="todo-count"><v-chip>{{ remaining }}</v-chip>  tâches à faire</div>
                <v-container > 
                    <v-btn-group>
                    <v-btn :class="{selected: filter === 'all'}" @click.prevent="filter ='all'">Toutes</v-btn>
                    <v-btn color="teal" :class="{selected: filter === 'todo'}" @click.prevent="filter ='todo'">A faire</v-btn>
                    <v-btn :class="{selected: filter === 'done'}" @click.prevent="filter ='done'">Faites</v-btn>
                    </v-btn-group>
                </v-container>
                
                <v-btn color="teal lighten-5" @click.prevent="deteleCompleted" v-if="done">supprimé les taches finis</v-btn>
            </v-container>
            
                
        </v-card>
     </v-container>
</template>
<script>
export default {
    name: 'TodoList', 
    data: () => ({
            todos: [{
                id:1,
                nom : "Faire un TodoList",
                completed: true
            },{
                id:2,
                nom:'Faire un crud',
                completed: true
            },
            {
                id:3,
                nom:'Faire un CvMaker',
                completed: false
            }],
            newTodo: '',
            filter : 'all',
            editing: {}
         
  }),
  methods:{
        addTodo (){
            let longueur = this.todos.length;
            this.todos.push({
                completed: false, 
                nom : this.newTodo,
                id: longueur+=1
                
            })
            this.newTodo = ""
        },
        deleteTodo (todo) {
            this.todos = this.todos.filter(ni => ni !== todo)
        },
        deteleCompleted (){
            this.todos = this.todos.filter(todo => !todo.completed)
        },
        editTodo(todo){
            this.editing = todo
        },
        doneEdit(){
            this.editing = {}
        }
			
		},
		computed: {
			allDone: {
				get (){
					return this.remaining == 0
				},
				set(value){
					this.todos.forEach(todo => {todo.completed = value})
				}
			},
			remaining () {
				return this.todos.filter(todo => ! todo.completed).length
			},
			done () {
				return this.todos.filter(todo => todo.completed)
			},
			filterredTodos(){
				if(this.filter === 'todo'){
					return this.todos.filter(todo => !todo.completed)
				}else if(this.filter === 'done'){
					return this.todos.filter(todo => todo.completed)
				}
				return this.todos
			}
		} 
}
</script>