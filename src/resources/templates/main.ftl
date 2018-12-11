<#import "parts/common.ftl" as c/>
<#import "parts/login.ftl" as l/>
<@c.page>
    <div>
    <@l.logout />
    </div>
    <span><a href="/user">Users list</a>  </span>
    <div>
        <form method="post" action="add">
            <input type="text" name="text" placeholder="type message"/>
            <input type="text" name="tag" placeholder="Tag"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/> <!--только для пост запросов-->
            <button type="Submit">Add</button>
        </form>
    </div>
    <div>List of messages</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter}"/>
        <button type="Submit">Find</button>
        </form>
<#list messages as message>
    <div>
        <b>${message.id}</b>
        <span>${message.text}</span>
        <i>${message.tag}</i>
        <strong>${message.authorName}</strong>
    </div>
    <#else>
        No messages
</#list>

</@c.page>