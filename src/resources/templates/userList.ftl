<html>
<head>

</head>
<body>


<table>
    <thread>
    <tr>
        <th>Name</th>
        <th>Role</th>
        <th></th>
    </tr>
    </thread>
{{#users}}
    <tbody>
        <tr>
        <td>{{username}}</td>
        <td class="list" type="text/css" href="/css/main.css">{{roles}}</td>
        <td><a href="/user/{{id}}">edit</a></td>
        </tr>
    </tbody>
{{/users}}
</table>


</body>
</html>