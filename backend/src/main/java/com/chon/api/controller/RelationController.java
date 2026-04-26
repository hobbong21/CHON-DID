package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.model.relation.RelationUserGetListRequest;
import com.chon.api.model.relation.RelationUsersCreateReq;
import com.chon.api.model.relation.RelationUsersUpdateReq;
import com.chon.api.service.RelationUsersService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/relation")
@RequiredArgsConstructor
public class RelationController {

    private final RelationUsersService relationUsersService;

    @PostMapping("/create")
    public ResponseData<Object> relationCreate(@RequestBody RelationUsersCreateReq request) {
        return new ResponseData<>().success(relationUsersService.create(request));
    }

    @PutMapping("/update")
    public ResponseData<Object> relationCreate(@RequestBody RelationUsersUpdateReq request) {
        return new ResponseData<>().success(relationUsersService.update(request));
    }

    @PostMapping("/list")
    public ResponseData<Object> getListByUserRelation(@RequestBody RelationUserGetListRequest request) {
        return new ResponseData<>().success(relationUsersService.getListRelationUser(request));
    }

    @PostMapping("/list-requester")
    public ResponseData<Object> getListRequester(@RequestBody RelationUserGetListRequest request) {
        return new ResponseData<>().success(relationUsersService.getListRequester(request));
    }

    @DeleteMapping("/delete/{id}")
    public ResponseData<Object> relationDelete(@PathVariable Long id) {
        relationUsersService.deleteRelation(id);
        return new ResponseData<>().success("Delete Success");
    }

    @GetMapping("/list-relation-type")
    public ResponseData<Object> getListRelationType() {
        return new ResponseData<>().success(relationUsersService.getListRelationType());
    }
}