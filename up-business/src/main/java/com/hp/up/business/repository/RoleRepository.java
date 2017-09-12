package com.hp.up.business.repository;

import com.hp.up.core.Entity.Role;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Set;

/**
 * @Author haopeng
 * @Date 2017/9/11 17:12
 */

@Component
public interface RoleRepository extends BaseRepository{

    String findRoleIds(Long userId);

    List<Role> getRolesByids(String ids);

    List<Role> getRolesWithPermissionByids(String ids);

}
