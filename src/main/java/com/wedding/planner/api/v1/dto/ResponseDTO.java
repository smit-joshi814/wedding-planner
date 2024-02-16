package com.wedding.planner.api.v1.dto;

public record ResponseDTO<T> (T items,Long total,Integer page,Integer perPage,Integer totalPages) {}
