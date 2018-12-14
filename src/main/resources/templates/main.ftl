<#import "parts/common.ftl" as c/>
<#import "parts/login.ftl" as l/>
<@c.page>

<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input class="form-control" type="text" name="filter" value="${filter?ifExists}" placeholder="Find by tag"/>
            <button type="Submit" class="btn btn-primary ml-2">Find</button>
        </form>
    </div>
</div>
<a class="btn btn-primary md-2" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new message
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input class="form-control" type="text" name="text" placeholder="Type message"/>
            </div>
            <div class="form-group">
                <input  class="form-control" type="text" name="tag" placeholder="Tag"/>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input  type="file" name="file" class="custom-file-input" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <div class="form-group">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/> <!--только для пост запросов-->
            </div>
            <div class="form-group">
                <button type="Submit" class="btn btn-primary ml-2">Add</button>
            </div>
        </form>
    </div>
</div>
<div class="card-columns">
    <#list messages as message>
        <div class="card my-3" style="width: 18rem;">
            <div class="card-img-top">
                <#if message.filename??>
                    <img src="/img/${message.filename}"/>
                </#if>
            </div>
            <div class="m-2">
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                ${message.authorName}
            </div>
        </div>
        <#else>
            No messages
    </#list>
</div>
</@c.page>