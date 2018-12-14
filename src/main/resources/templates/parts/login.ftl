    <#macro login path isRegisterForm>

        <form action="${path}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> User Name :</label>
                <div class="col-sm-300">
                    <input class="form-control" type="text" name="username" placeholder="User Name"/>
                </div>
            </div>
            <div class="form-group row">
                <label  class="col-sm-2 col-form-label"> Password:</label>
                <div class="col-sm-300">
                    <input class="form-control" type="password" name="password" placeholder="Password"/>
                </div>
            </div>
            <#if !isRegisterForm>
                <a href="/registration">Add user</a>
            </#if>
            <div>
                <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign In</#if></button>
            </div>
    </#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div>
            <button type="submit" class="btn btn-primary">Sign Out</button>
        </div>
    </form>
</#macro>