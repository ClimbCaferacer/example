<html>
<head>

</head>
<body>
{{#user}}
<form action="/user" method="post">
    <input type="hidden" name="_csrf" value="{{_csrf.token}}"/>
    <input type="hidden" name="id" value="{{id}}"/>
    User name: <input type="text" name="username" value="{{username}}"/>
    <div>
        {{#all_roles}}
        <label><input type="checkbox" name="roles">{{name}}</label>
        {{/all_roles}}
    </div>


    <button type="submit">Save</button>
</form>
{{/user}}
</body>
</html>