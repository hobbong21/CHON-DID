package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.entity.CategoryEntity;
import com.chon.api.model.category.SubLevelListResModel;
import com.chon.api.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * api danh sách cấu hình
     *
     * @param code
     * @return
     */
    @GetMapping("/list")
    public ResponseData<List<CategoryEntity>> categoryList(@RequestParam String code) {
        return new ResponseData<List<CategoryEntity>>().success(categoryService.categoryList(code));
    }

    /**
     * api danh sách cấu hình
     *
     * @param code
     * @return
     */
    @GetMapping("/sub-level")
    public ResponseData<List<SubLevelListResModel>> subLevelList(@RequestParam String code) {
        return new ResponseData<List<SubLevelListResModel>>().success(categoryService.subLevelList(code));
    }
}
