<#import "parts/common.ftl" as c/>
<@c.page>
User Editor
<form action="/user" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="hidden" name="userId" value="${user.id}"/>
    User name: <input type="text" name="username" value="${user.username}"/>
    <div>
        <#list roles as role>
        <label><input type="checkbox" name="${role}" $user.role?seq_contains(role)?string("checked"," ") >${role}</label>
        </#list>
    </div>


    <button type="Submit">Save</button>
</form>
</@c.page>