# Acorde pra vida! API
REST API for "Acorde pra vida!" website, part of the final project from Web Development subject at CEFET-MG

Esta api está publicada [aqui](https://acordepravida-api.herokuapp.com/api)!

---

# Executando

Para executar a API localmente basta clonar o repositório e executar o comando `docker-compose up`. Para isso, é necessário ter o [Docker](https://www.docker.com) instalado.

---

# Endpoints
Estes são os endpoints disponíveis na API

## **Cadastro**

### **Criar conta** ✅

```
POST /api/signup
Content-Type: application/json

{
  'name': string,
  'email': string,
  'emailConfirmation': string,
  'password': string
}
```

### **Login**  ✅

```
POST /api/login
Content-Type: application/json

{
  'email': string,
  'password': string
}
```

### **Logout**  ✅

```
POST /api/logout/<ID DO USUÁRIO>
```

## **Usuário**

### **Alterar dados cadastrais** ✅

```
PUT /api/users/<ID DO USUÁRIO>
Content-Type: application/json

{
  'email': string,
  'password': string
}
```

### **Buscar usuário** ✅
```
GET /api/users/<EMAIL DO USUÁRIO>
```

## **Músicas**

### **Buscar músicas** ✅

Retorna as 10 primeiras músicas por padrão

```
GET /api/songs
Content-Type: application/json
```

Essa requisição aceita paginação a partir dos parâmetros `take` e `skip`

```
GET /api/songs?take=<TAKE>&skip=<SKIP>
Content-Type: application/json
```
ou buscar uma música específica
```
GET /api/songs/<ID DA MÚSICA>
Content-Type: application/json
```

### **Criar música** ✅

```
POST /api/songs
Content-Type: application/json

{
  'name': string,
  'artistId': string,
  'userId': string,
  'content': string,
  'level': string,
  'genre': string,
  'videoUrl': string
}
```

### **Editar música** ✅

```
PUT /api/songs/<ID DA MÚSICA>
Content-Type: application/json

{
  'name': string,
  'artistId': string,
  'userId': string,
  'content': string,
  'level': string,
  'genre': string,
  'videoUrl': string
}
```

## **Artistas**

### **Buscar artistas** ✅

Retorna os 10 primeiras artistas por padrão

```
GET /api/artists
Content-Type: application/json
```

Essa requisição aceita paginação a partir dos parâmetros `take` e `skip`

```
GET /api/artists?take=<TAKE>&skip=<SKIP>
Content-Type: application/json
```
ou buscar um artista específico
```
GET /api/artists/<ID DO ARTISTA>
Content-Type: application/json
```

### **Criar artista** ✅

```
POST /api/artists
Content-Type: application/json

{
  'name': string,
  'genre': string,
  'photoUrl': string
}
```

### **Editar artista** ✅

```
PUT /api/artists
Content-Type: application/json

{
  'name': string,
  'photoUrl': string,
  'musicStyle': string,
  'views': number,
  'rating': number,
}
```
